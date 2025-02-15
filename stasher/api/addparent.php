<?php
include('model/users.php');

$usrObj = new Model_Users();


if($_POST['parentId'] != ''  &&  $_POST['childId'] != '')
{
		$parentId = $_POST['parentId'];
		$childId = $_POST['childId'];
		$relation_type = $_POST['relation_type'];
		$userArray1 = $usrObj->getUserDetailsByUserId($parentId);
		if($userArray1)
		{
			
			$userArray2 = $usrObj->getUserDetailsByUserId($childId);
			if($userArray2)
			{
					$userArray3 =  $usrObj->checkRelationExistOrNot($childId,$parentId);
						if(empty($userArray3))
						{
				
							if($relation_type == '2')
							$relation = 'Family';
							elseif($relation_type == '3')					
							$relation = 'Friend';
							else
							$relation = 'Parent';
							
							
							$userArray = array();	
							$userArray['childId'] = $childId;	
$userArray['parentId'] =$parentId;	                                                                                                                                                            
$userArray['requestfrom'] = $childId;	
							$userArray['requestto'] = $parentId;								
$userArray['parent_type'] = $relation_type;	
							$userArray['relation_name'] = $relation;	
							$userArray['inserted_date'] = date("Y-m-d H:i:s");	
							$userArray['status'] = 1;	
							$userArray = $usrObj->addRelation($userArray);
							
							
							$childDetails = $usrObj->getUserInformationByUserId($childId);
							$description = $childDetails['fname'].' '.$childDetails['lname'].' has requested to add you as a Parent. Accept now!';
							$activityArray = array();
							$activityArray['userId'] = $parentId;	
$activityArray['title'] = 'commander request from '.$childDetails['fname'].' '.$childDetails['lname'];
							$activityArray['description'] = $description;
							$activityArray['requestfrom'] = $childId;	
							$activityArray['activity_type'] = '10';
							$activityArray['inserted_date'] = date("Y-m-d H:i:s");	
							$usrObj->addActivity($activityArray);
							
							$parentDetails = $usrObj->getUserInformationByUserId($parentId);
							
							
							
                                                        // send ios push  notification to the parent.
                                                        $devicetoken = $parentDetails['devicetoken'];
                                                       

                                                        sendPushNotificationToIOSDevice($devicetoken,$description);
                                                        
                                                        
							$marray['success']['code'] = "102";
							$marray['success']['message'] = "You’ve sent a Parent Request to ".$parentDetails['fname']." ".$parentDetails['lname']." Hope to hear back soon!";
						}
						else
						{
							$marray['error']['code'] = "102";
							$marray['error']['message'] = "A parent is already added or request already sent.";
						}
						
			}
			else
			{
				$marray['error']['code'] = "102";
				$marray['error']['message'] = "Invalid Parent";
			}
			
		}
		else
		{
			$marray['error']['code'] = "102";
			$marray['error']['message'] = "Invalid Parent";
		}
	
}
else
{
	$marray['error']['code'] = "101";
	$marray['error']['message'] = "Please chcek your compulsory fields.";
}
echo json_encode($marray);
?>

<?php
include('model/users.php');

$usrObj = new Model_Users();

//echo "<pre>";print_r($_POST);exit;
	
		
$marray = array();
if($_POST['userId'] != '' )
{

			$userId = $_POST['userId'];
			$activityArray = $usrObj->getMyActivities($userId);
				
				if($activityArray)
				{			
					$k=0;
					while($k < count($activityArray) )
					{
						$activityuserdetails[$k] = $usrObj->getUserInformationByUserId($activityArray[$k]['requestfrom']);
						
						$marray[$k]['activityId'] = $activityArray[$k]['id'];
						$marray[$k]['userId'] = $activityArray[$k]['userId'];
						$marray[$k]['fname'] = $activityuserdetails[$k]['fname'];
						$marray[$k]['lname'] = $activityuserdetails[$k]['lname'];
						$marray[$k]['avatar'] = SITEURL.'/dynamicAssets/users/avatar/'.$activityuserdetails[$k]['avatar'];
						$marray[$k]['title'] = $activityArray[$k]['title'];
						$marray[$k]['description'] = $activityArray[$k]['description'];
						$marray[$k]['inserted_date'] = $activityArray[$k]['inserted_date'];						
						$marray[$k]['activity_type'] = $activityArray[$k]['activity_type'];
						$marray[$k]['seenstatus'] = $activityArray[$k]['seenstatus'];
						
						
						
						
$marray[$k]['requestfrom'] = $activityArray[$k]['requestfrom'];
;
						
						$k++;
					}
				}
				else
				{
					$marray['error']['code'] = "404";
					$marray['error']['message'] = "There is no activity";
					
				}
				
		
								
}
else
{
	$marray['error']['code'] = "101";
	$marray['error']['message'] = "Please chcek your compulsory fields.";
}
echo json_encode($marray);
?>

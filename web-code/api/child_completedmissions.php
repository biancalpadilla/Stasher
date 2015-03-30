<?php
include('model/missions.php');

$msnObj = new Model_Mission();
include('model/users.php');
$usrObj = new Model_Users();

//echo "<pre>";print_r($_POST);exit;
	
		
$marray = array();
if($_POST['childId'] != '' )
{

			$childId = $_POST['childId'];
			$currentdate = date("Y-m-d H:i:s");
			$missionArray = $msnObj->getAllCompletedMissionsByChildId($childId,$currentdate);
				
				if($missionArray)
				{			
					$k=0;
					while($k < count($missionArray) )
					{
	
						$marray[$k]['missionId'] = $missionArray[$k]['id'];
						$marray[$k]['title'] = $missionArray[$k]['title'];
						$marray[$k]['description'] = $missionArray[$k]['description'];
						$marray[$k]['parentId'] = $missionArray[$k]['parentId'];
						$marray[$k]['childId'] = $missionArray[$k]['childId'];
						$userArray[$k]['info']= $usrObj->getUserInformationByUserId($missionArray[$k]['parentId']);
						if($userArray[$k]['info']['avatar']!='')
						$marray[$k]['parent']['avatar'] = SITEURL.'/dynamicAssets/users/avatar/'.$userArray[$k]['info']['avatar'];
						else
						$marray[$k]['parent']['avatar'] = '';
							$marray[$k]['parent']['userId'] = $userArray[$k]['info']['userId'];
						$marray[$k]['parent']['fname'] = $userArray[$k]['info']['fname'];
						$marray[$k]['parent']['lname'] = $userArray[$k]['info']['lname'];
						
						
						$marray[$k]['isTimebase'] = $missionArray[$k]['isTimebase'];
						$marray[$k]['totaltime'] = $missionArray[$k]['totaltime'];					
						$marray[$k]['isPublic'] = $missionArray[$k]['isPublic'];
						$marray[$k]['status'] = $missionArray[$k]['status'];
						$marray[$k]['rewardtype'] = $missionArray[$k]['rewardtype'];
						$marray[$k]['rewards'] = $missionArray[$k]['rewards'];
						$marray[$k]['inserted_date'] = $missionArray[$k]['inserted_date'];
						
						$k++;
					}
				}
				else
				{
					$marray['error']['code'] = "101";
					$marray['error']['message'] = "There is no completed missions.";
					
				}
				
		
								
}
else
{
	$marray['error']['code'] = "101";
	$marray['error']['message'] = "Please chcek your compulsory fields.";
}
echo json_encode($marray);
?>

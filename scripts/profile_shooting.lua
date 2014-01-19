--[[
rem How fast can we trigger the shots? Download the jpegs afterwords
rem and check their exif data.
rem http://chdk.wikia.com/wiki/HDR_Fast_Shooter
@title Profile Shooting Speed

@param n number of images
@default n 5
--]]

press("shoot_half")
repeat sleep(10) until get_shooting() == true

release("shoot_half")
repeat sleep(10) until get_shooting() == false

repeat 
	n = n - 1
	ecnt=get_exp_count()
	
	press("shoot_full_only")
	repeat sleep(10) until (get_exp_count()~=ecnt)
	release("shoot_full_only")
	
	until n < 1

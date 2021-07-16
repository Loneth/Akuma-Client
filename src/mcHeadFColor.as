package 
{
    import flash.display.*;

    dynamic public class mcHeadFColor extends MovieClip
    {

        public function mcHeadFColor()
        {
            addFrameScript(0, frame1);
            return;
        }// end function

        function frame1()
        {
            try
            {
                MovieClip(this.stage.getChildAt(0)).mcSetColor(this, "Skin", "None");
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

    }
}

// Decompiled by AS3 Sorcerer 1.40
// http://www.as3sorcerer.com/

//Game123_fla.mcBtnCharacter_100

package Game123_fla
{
    import flash.display.MovieClip;
    import flash.display.SimpleButton;
    import flash.text.TextField;

    public dynamic class mcBtnCharacter_100 extends MovieClip 
    {

        public var btnCharacter1:SimpleButton;
        public var txtCharacter:TextField;
		public var txtIndex:TextField;

        public function mcBtnCharacter_100()
        {
            addFrameScript(0, frame1);
        }

        function frame1()
        {
            stop();
			txtCharacter.mouseEnabled = false;
			txtCharacter.mouseChildren = false;
			txtIndex.mouseEnabled = false;
			txtIndex.mouseChildren = false;
        }


    }
}//package Game123_fla


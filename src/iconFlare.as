// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//iconFlare

package {
    import flash.display.MovieClip;

    public dynamic class iconFlare extends MovieClip {

        public var bg:MovieClip;
		public var lock:MovieClip;
		
		function frame1(){
			lock.visible = true;
		}

        public function iconFlare(){
            addFrameScript(8, this.frame9);
        }

        function frame9(){
            MovieClip(parent).removeChild(this);
            stop();
        }


    }
}//package 


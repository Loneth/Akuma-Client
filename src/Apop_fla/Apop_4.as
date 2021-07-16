// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//Apop_fla.Apop_4

package Apop_fla{
    import flash.display.MovieClip;

    public dynamic class Apop_4 extends MovieClip {

        public var npc:MovieClip;

        public function Apop_4(){
            addFrameScript(0, this.frame1, 1, this.frame2, 9, this.frame10, 27, this.frame28, 30, this.frame31, 37, this.frame38, 45, this.frame46, 53, this.frame54, 56, this.frame57, 63, this.frame64, 71, this.frame72);
        }

        function frame1(){
            this.npc.visible = false;
        }

        function frame2(){
            stop();
        }

        function frame10(){
            this.npc.visible = true;
        }

        function frame28(){
            stop();
        }

        function frame31(){
            this.npc.visible = true;
        }

        function frame38(){
            gotoAndPlay("init");
        }

        function frame46(){
            this.npc.visible = true;
        }

        function frame54(){
            stop();
        }

        function frame57(){
            this.npc.visible = true;
        }

        function frame64(){
            gotoAndPlay("init");
        }

        function frame72(){
            gotoAndStop("hold");
        }


    }
}//package Apop_fla


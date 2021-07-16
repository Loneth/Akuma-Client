// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//RandomNumber

package {
    public class RandomNumber {

        const MAX_RATIO:Number = 4.6566128752458E-10;
        const NEGA_MAX_RATIO:Number = -(MAX_RATIO);

        private var r:int;
        private var randNum:Number;

        public function RandomNumber(){
            r = (Math.random() * int.MAX_VALUE);
            super();
        }

        public function rand(_arg1:Number=0, _arg2:Number=1):Number{
            randNum = ((XORandom() * (_arg2 - _arg1)) + _arg1);
            return ((((randNum)<_arg2) ? randNum : _arg2));
        }

        private function XORandom():Number{
            r = (r ^ (r << 21));
            r = (r ^ (r >>> 35));
            r = (r ^ (r << 4));
            if (r > 0){
                return ((r * MAX_RATIO));
            };
            return ((r * NEGA_MAX_RATIO));
        }

        public function newSeed():void{
            r = (Math.random() * int.MAX_VALUE);
        }


    }
}//package 


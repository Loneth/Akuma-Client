// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//SoundFX

package {
    import flash.events.EventDispatcher;
    import flash.system.ApplicationDomain;
    import flash.media.SoundTransform;

    public class SoundFX extends EventDispatcher {

        private var sfx:Object;
        private var assetsDomain:ApplicationDomain;
        public var stf:SoundTransform;
        public var bSoundOn:Boolean = true;

        public function SoundFX(_arg1:ApplicationDomain){
            sfx = {};
            stf = new SoundTransform(0.7, 0);
            super();
            this.assetsDomain = _arg1;
            var _local2:Array = ["Achievement", "Bad", "Click", "ClickBig", "ClickMagic", "Coins", "Energy", "Evil", "Fire", "Good", "Heal", "Hit1", "Hit2", "Hit3", "Miss", "VeryGood", "Water", "Wind"];
        }

        public function playSound(_arg1:String):void{
            var AssetClass:Class;
            var strSound:String = _arg1;
            if (bSoundOn){
                if (sfx[strSound] != null){
                    sfx[strSound].play(0, 0, stf);
                }
                else {
                    try {
                        if (assetsDomain.hasDefinition(strSound)){
                            AssetClass = (assetsDomain.getDefinition(strSound) as Class);
                            sfx[strSound] = new (AssetClass)();
                            sfx[strSound].play(0, 0, stf);
                        }
                        else {
                            trace((("SoundFX : Definition '" + strSound) + "' not found in assetsDomain"));
                        };
                    }
                    catch(e:Error) {
                        trace("SoundFX Error: ");
                        trace(e);
                    };
                };
            };
        }

        public function soundOn():void{
            bSoundOn = true;
        }

        public function soundOff():void{
            bSoundOn = false;
        }


    }
}//package 


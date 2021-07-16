// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//soundController

package {
    import flash.display.MovieClip;
    import flash.media.SoundChannel;
    import flash.media.Sound;
    import flash.media.SoundMixer;

    public class soundController {

        private var rootClass:MovieClip;
        private var bSong:Boolean;
        private var songOn:Boolean;
        private var mChannel:SoundChannel;
        private var btnSong:MovieClip;
        private var songClass:Sound;

        public function soundController(_arg1:Sound, _arg2:MovieClip){
            this.rootClass = _arg2;
            this.mChannel = new SoundChannel();
            this.mChannel.soundTransform.volume = 0.35;
            this.bSong = false;
            this.songClass = _arg1;
            this.songOn = true;
        }

        public function checkSound(_arg1:MovieClip):void{
            if (this.rootClass.mixer.bSoundOn){
                if (this.songOn){
                    if (!this.bSong){
                        this.mChannel = this.songClass.play(0, 9999, this.mChannel.soundTransform);
                        this.bSong = true;
                        if (_arg1 != null){
                            _arg1.txtMusic.text = "Music On";
                        };
                    };
                }
                else {
                    if (_arg1 != null){
                        _arg1.txtMusic.text = "Music Off";
                    };
                };
            }
            else {
                if (_arg1 != null){
                    _arg1.txtMusic.text = "Music Off";
                };
            };
        }

        public function stopMusic(_arg1:MovieClip):void{
            SoundMixer.stopAll();
            this.songOn = false;
            if (_arg1 != null){
                _arg1.txtMusic.text = "Music Off";
            };
        }

        public function buttonClick(_arg1:MovieClip):void{
            if (this.bSong){
                SoundMixer.stopAll();
                this.songOn = false;
                _arg1.txtMusic.text = "Music Off";
            }
            else {
                if (this.rootClass.mixer.bSoundOn){
                    this.mChannel = this.songClass.play(0, 9999, this.mChannel.soundTransform);
                    this.songOn = true;
                    _arg1.txtMusic.text = "Music On";
                };
            };
            this.bSong = !(this.bSong);
        }


    }
}//package 


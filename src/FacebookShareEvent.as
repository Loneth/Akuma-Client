// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//FacebookShareEvent

package {
    import flash.events.Event;

    public class FacebookShareEvent extends Event {

        public static const SHARE:String = "fb_share";
        public static const LOGIN:String = "fb_login";
        public static const FRIENDS:String = "fb_friends";
        public static const POST:String = "fb_post";

        public var args:Object = "";
        public var status:Boolean = true;

        public function FacebookShareEvent(_arg1:String, _arg2:Boolean=true){
            this.status = _arg2;
            super(_arg1, false, false);
        }

    }
}//package 


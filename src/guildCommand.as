// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//LPFPanelBg5

package {
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.text.TextField;
	import flash.utils.Timer;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.media.SoundMixer;
	import flash.media.SoundTransform;
	import flash.net.navigateToURL;
	import flash.net.URLRequest;
	//import flash.external.ExternalInterface;

	public dynamic class guildCommand extends MovieClip {

		public var btnMember:SimpleButton;
		public var btnOfficer:SimpleButton;
		public var btnLeader:SimpleButton;
		
		public function guildCommand(){
			addFrameScript(0, frame1, 1, frame2, 2, frame3);
			rootClass = MovieClip(Game.root);
			super();
		}
		
		function frame1(){
			btnMember.addEventListener(MouseEvent.CLICK, toMember);
			btnOfficer.addEventListener(MouseEvent.CLICK, toOfficer);
			btnLeader.addEventListener(MouseEvent.CLICK, toLeader);
			stop();
		}
		
		function frame2(){
			btnMember.addEventListener(MouseEvent.CLICK, toMember);
			btnOfficer.addEventListener(MouseEvent.CLICK, toOfficer);
			btnLeader.addEventListener(MouseEvent.CLICK, toLeader);
			stop();
		}
		
		function frame3(){		
			btnMember.addEventListener(MouseEvent.CLICK, toMember);
			btnOfficer.addEventListener(MouseEvent.CLICK, toOfficer);
			btnLeader.addEventListener(MouseEvent.CLICK, toLeader);
			stop();
		}
		
		function toLeader(evt:MouseEvent):void {
			gotoAndStop(3);
			rootClass.mixer.playSound("Click");
		}
		
		function toOfficer(evt:MouseEvent):void {
			gotoAndStop(2);
			rootClass.mixer.playSound("Click");
		}
		
		function toMember(evt:MouseEvent):void {		
			gotoAndStop(1);
			rootClass.mixer.playSound("Click");
		}
		
	}
}//package 


// Hidden Project Augoeides - Official Client Source
// http://www.as3sorcerer.com/

//MCUpgradeWindow

package {
    import flash.display.MovieClip;
    import flash.display.SimpleButton;
	import flash.display.DisplayObject
    import flash.text.TextField;
    import flash.display.*;
    import flash.events.*;
    import flash.text.*;
    import flash.media.*;
    import flash.net.*;
    import flash.geom.*;
    import flash.system.*;
    import flash.utils.*;
    import flash.filters.*;
    import flash.external.*;
    import flash.ui.*;
    import adobe.utils.*;
    import flash.accessibility.*;
    import flash.errors.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.sampler.*;
    import flash.xml.*;
	import flash.geom.Transform;
	import flash.geom.ColorTransform;
	import fl.motion.Color;

    public dynamic class MCSkillTree extends MovieClip {

        public var btnClose2:SimpleButton;
        public var btnClose:SimpleButton;
		public var btnReset:SimpleButton;
        public var rootClass:MovieClip;
		public var txtSkillPoints:TextField;
		public var color:Color = new Color();
		public var color2:Color = new Color();
		public var s1:MovieClip;
		public var s2:MovieClip;
		public var s3:MovieClip;
		public var s4:MovieClip;
		public var s5:MovieClip;
		public var s6:MovieClip;
		public var s7:MovieClip;
		public var s8:MovieClip;
		public var s9:MovieClip;
		public var s10:MovieClip;
		public var s11:MovieClip;
		public var s12:MovieClip;
		public var s13:MovieClip;
		public var s14:MovieClip;
		public var s15:MovieClip;
		public var s16:MovieClip;
		public var s17:MovieClip;
		public var s18:MovieClip;
		public var s19:MovieClip;
		public var s20:MovieClip;
		public var s21:MovieClip;
		public var a1:MovieClip;
		public var a2:MovieClip;
		public var a3:MovieClip;
		public var a4:MovieClip;
		public var a5:MovieClip;
		public var a6:MovieClip;
		public var a7:MovieClip;
		public var a8:MovieClip;
		public var a9:MovieClip;
		public var a10:MovieClip;
		public var a11:MovieClip;
		public var a12:MovieClip;
		public var a13:MovieClip;
		public var a14:MovieClip;
		public var a15:MovieClip;
		public var a16:MovieClip;
		public var a17:MovieClip;
		public var a18:MovieClip;
		public var a19:MovieClip;
		public var a20:MovieClip;
		public var a21:MovieClip;
		public var d1:MovieClip;
		public var d2:MovieClip;
		public var d3:MovieClip;
		public var d4:MovieClip;
		public var d5:MovieClip;
		public var d6:MovieClip;
		public var d7:MovieClip;
		public var d8:MovieClip;
		public var d9:MovieClip;
		public var d10:MovieClip;
		public var d11:MovieClip;
		public var d12:MovieClip;
		public var d13:MovieClip;
		public var d14:MovieClip;
		public var d15:MovieClip;
		public var d16:MovieClip;
		public var d17:MovieClip;
		public var d18:MovieClip;
		public var d19:MovieClip;
		public var d20:MovieClip;
		public var d21:MovieClip;

        public function MCSkillTree(){
            addFrameScript(0, frame1);
			rootClass = stage.getChildAt(0);
		}
		
		public function onClose(_arg1:MouseEvent):void{
            MovieClip(parent).gotoAndStop("Init");
			rootClass.mixer.playSound("Click");
        }
		
        function frame1(){
			txtSkillPoints.text = "Remaining Skill Points: " + rootClass.world.myAvatar.objData.intSkillPoints;
			btnReset.addEventListener(MouseEvent.CLICK, onResetSkill, false, 0, true);
			btnClose.addEventListener(MouseEvent.CLICK, onClose, false, 0, true);
            var AttackSkills:* = ["s1", "s2", "s3", "s4", "s5", "s6", "s7", "s8", "s9", "s10", "s11", "s12", "s13", "s14", "s15", "s16", "s17", "s18", "s19", "s20", "s21", "a1", "a2", "a3", "a4", "a5", "a6", "a7", "a8", "a9", "a10", "a11", "a12", "a13", "a14", "a15", "a16", "a17", "a18", "a19", "a20", "a21", "d1", "d2", "d3", "d4", "d5", "d6", "d7", "d8", "d9", "d10", "d11", "d12", "d13", "d14", "d15", "d16", "d17", "d18", "d19", "d20", "d21"];
			var SkillDetails:Object = {};
			var SkillBG:MovieClip;
			var Skill:*;
			var mySkill:*;
			var Counter = 0;
			var Slot2, oSlot;
			color.brightness = -0.5;      
            while (Counter < AttackSkills.length) {
                SkillDetails = AttackSkills[Counter];
				Slot2 = AttackSkills[Counter];
                SkillBG = (getChildByName(SkillDetails) as MovieClip);
                Skill = rootClass.world.getActionbyTreeSlot(Slot2);
				mySkill = rootClass.world.getActionByRef(Slot2);
                if (Skill == null){
                    SkillBG.visible = false;
                } else {
					if(Skill != mySkill){
						color.brightness = 0;
						SkillBG.btnAddSkill.visible = false;
					} else {
						color.brightness = -0.7;
						SkillBG.btnAddSkill.visible = true;
					};
					/** SET ICON **/
					rootClass.updateIcons([SkillBG], Skill.icon.split(","), null);
					SkillBG.visible = true;
					SkillBG.tQty.visible = false;
					//SkillBG.tSlot.visible = false;
					SkillBG.cnt.transform.colorTransform = color;
					SkillBG.bg.transform.colorTransform = color;
					SkillBG.actObj = Skill;
					SkillBG.addEventListener(MouseEvent.MOUSE_OVER, rootClass.actIconOver, false, 0, true);
					SkillBG.addEventListener(MouseEvent.MOUSE_OUT, rootClass.actIconOut, false, 0, true);
					SkillBG.btnAddSkill.actObj = Skill;
					//rootClass.SkillSlotMC = AttackSkills[Counter];
					SkillBG.btnAddSkill.addEventListener(MouseEvent.CLICK, onAddSkill, false, 0, true);
                };
                Counter++;
            };
            stop();
        }
		
		public function onAddSkill(_arg1:MouseEvent):void{
			var SkillTab:MovieClip;
            SkillTab = MovieClip(_arg1.currentTarget);
			SkillProperties = SkillTab.actObj;
			rootClass.SkillSlotMC = SkillProperties.ref;
			color.brightness = 0;
			rootClass.sfc.sendXtMessage("zm", "gst", [SkillProperties.id, SkillProperties.requiredskill], "str", 1);	
		}
		
		public function onResetSkill(_arg1:MouseEvent):void{
			rootClass.sfc.sendXtMessage("zm", "rst", [], "str", 1);	
		}
		
    }
}//package 


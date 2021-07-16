// Decompiled by AS3 Sorcerer 3.00
// http://www.as3sorcerer.com/

//LPFLayoutUpgrade

package 
{
    import flash.display.MovieClip;
    import flash.display.*;
    import flash.text.*;

    public class LPFLayoutUpgrade extends LPFLayout 
    {

        public var iSel:Object;
        public var refinePanel:MovieClip;
        public var itemsI:Array;
        public var itemsU:Array;
        public var rootClass:MovieClip;

        public function LPFLayoutUpgrade():void
        {
            x = 0;
            y = 0;
            panels = [];
            fData = {};
			
        }

        override public function fOpen(_arg_1:Object):void
        {
            var _local_2:Object;
            var _local_3:String;
            var _local_4:Object;
            var _local_5:MovieClip;
            var _local_6:ModalMC;
            var _local_7:Object;
            _local_6 = new ModalMC();
            _local_7 = {};
            rootClass = MovieClip(stage.getChildAt(0));
            fData = _arg_1.fData;
            sMode = _arg_1.sMode;
            if (("itemsI" in fData))
            {
                itemsI = fData.itemsI;
            };
            if (("itemsU" in fData))
            {
                itemsU = fData.itemsU;
            };
            _local_2 = _arg_1.r;
            _local_3 = "";
            x = _local_2.x;
            y = _local_2.y;
            w = _local_2.w;
            h = _local_2.h;
            _local_4 = {};
            _local_4.panel = new LPFPanelUpgrade();
            _local_4.fData = {
                "itemsI":itemsI,
                "itemsU":itemsU,
                "avatar":rootClass.world.myAvatar,
                "objData":fData.objData
            };
            _local_4.r = {
                "x":30,
                "y":80,
                "w":900,
                "h":400
            };
            _local_4.showDragonRight = true;
            _local_4.showDragonLeft = true;
            _local_4.isOpen = true;
            refinePanel = addPanel(_local_4);
            updatePreviewButtons();
            rootClass.dropStackBoost();
        }


    }
}//package 


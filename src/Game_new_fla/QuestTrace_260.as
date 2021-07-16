// Hidden Project v4 : Daemon - Infinity Arts Team
// http://augoeides.org/ - All Wrongs Reserved.

//Game_new_fla.QuestTrace_260

package Game_new_fla
{
    import flash.display.MovieClip;
    import flash.display.SimpleButton;
    import flash.text.TextField;
    import flash.events.MouseEvent;
    import flash.events.TextEvent;
    import flash.events.Event;
    import flash.display.*;
    import flash.events.*;
    import flash.text.*;
    import flash.net.*;
    import flash.geom.*;
    import flash.system.*;
    import flash.utils.*;
    import flash.media.*;
    import flash.filters.*;
    import flash.ui.*;
    import flash.external.*;
    import flash.accessibility.*;
    import flash.errors.*;

    public dynamic class QuestTrace_260 extends MovieClip 
    {

        public var btnShow:MovieClip;
        public var btnClose:SimpleButton;
        public var moy:int;
        public var mox:int;
        public var bg:MovieClip;
        public var world:MovieClip;
        public var hit:MovieClip;
        public var hitSearch:MovieClip;
        public var hitNow:MovieClip;
        public var mDown:Boolean;
        public var rootClass:MovieClip;
        public var ox:int;
        public var oy:int;
        public var ti:TextField;
        public var qIDs:Array;
        public var isShow:Boolean;
        public var mc:MovieClip;

        public function QuestTrace_260()
        {
            addFrameScript(0, frame1);
        }
        public function updateQuestTrace(_arg1:Boolean=false):void
        {
            if (((isShow) || (_arg1))){
                fOpen();
            };
        }
        public function fOpen():void
        {
            var _local1:MovieClip;
            _local1 = (this as MovieClip);
            _local1.btnShow.visible = false;
            _local1.btnShow.removeEventListener(MouseEvent.CLICK, btnOpenClick);
            _local1.btnShow.removeEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
            _local1.btnShow.removeEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
            _local1.btnClose.addEventListener(MouseEvent.CLICK, btnCloseClick, false, 0, true);
            _local1.hit.addEventListener(MouseEvent.MOUSE_DOWN, onHouseMenuBGClick, false, 0, true);
            _local1.hit.addEventListener(Event.ENTER_FRAME, onHouseMenuBGEnterFrame, false, 0, true);
            _local1.btnClose.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
            _local1.btnClose.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
            _local1.hit.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
            _local1.hit.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
            _local1.bg.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
            _local1.bg.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
            _local1.ti.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
            _local1.ti.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
            _local1.ti.addEventListener(TextEvent.LINK, tiLinkHandler);
            _local1.hitSearch.addEventListener(MouseEvent.CLICK, hitSearchClick, false, 0, true);
            _local1.hitNow.addEventListener(MouseEvent.CLICK, btnOpenClick, false, 0, true);
            _local1.visible = true;
            if (!isShow){
                _local1.x = 760;
            };
            isShow = true;
            showQuestList();
        }
        public function fClose():void
        {
            var _local1:MovieClip;
            _local1 = MovieClip(this);
            _local1.btnShow.visible = true;
            _local1.btnShow.addEventListener(MouseEvent.CLICK, btnOpenClick, false, 0, true);
            _local1.btnShow.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
            _local1.btnShow.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
            _local1.btnClose.removeEventListener(MouseEvent.CLICK, btnCloseClick);
            _local1.hit.removeEventListener(MouseEvent.MOUSE_DOWN, onHouseMenuBGClick);
            _local1.hit.removeEventListener(Event.ENTER_FRAME, onHouseMenuBGEnterFrame);
            _local1.btnClose.removeEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
            _local1.btnClose.removeEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
            _local1.hit.removeEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
            _local1.hit.removeEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
            _local1.bg.removeEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
            _local1.bg.removeEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
            _local1.ti.removeEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
            _local1.ti.removeEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
            _local1.ti.removeEventListener(TextEvent.LINK, tiLinkHandler);
            _local1.hitSearch.removeEventListener(MouseEvent.CLICK, hitSearchClick);
            _local1.hitNow.removeEventListener(MouseEvent.CLICK, btnOpenClick);
            _local1.x = 1000;
            isShow = false;
        }
        public function btnCloseClick(_arg1:MouseEvent=null):void
        {
            rootClass.mixer.playSound("Click");
            fClose();
        }
        public function btnOpenClick(_arg1:MouseEvent=null):void
        {
            rootClass.mixer.playSound("Click");
            fOpen();
        }
        public function tiLinkHandler(_arg1:TextEvent):void
        {
            var _local2:String;
            var _local3:Array;
            var _local4:String;
            _local2 = _arg1.text;
            _local3 = _local2.split(",");
            _local4 = _local3[0];
            switch (_local4){
                case "Quest":
                    rootClass.world.toggleQuestShow(_local3[1]);
                    return;
                case "NPC":
                case "Item":
                    rootClass.world.transmitter(_local3[1], _local3[2], "Spawn");
                    return;
            };
        }
        public function hitSearchClick(_arg1:MouseEvent=null):void
        {
            rootClass.world.searchQuest();
            ti.htmlText = '<font color="#DDDDDD">查询中...</font>';
        }
        public function onHouseMenuBGClick(_arg1:MouseEvent):void
        {
            var _local2:MovieClip;
            _local2 = MovieClip(this);
            _local2.mDown = true;
            _local2.ox = _local2.x;
            _local2.oy = _local2.y;
            _local2.mox = stage.mouseX;
            _local2.moy = stage.mouseY;
            stage.addEventListener(MouseEvent.MOUSE_UP, onHouseMenuBGRelease, false, 0, true);
        }
        public function onHouseMenuBGRelease(_arg1:MouseEvent):void
        {
            var _local2:MovieClip;
            _local2 = MovieClip(this);
            _local2.mDown = false;
            stage.removeEventListener(MouseEvent.MOUSE_UP, onHouseMenuBGRelease);
        }
        public function onHouseMenuBGEnterFrame(_arg1:Event)
        {
            var _local2:MovieClip;
            _local2 = (_arg1.currentTarget.parent as MovieClip);
            if (_local2.visible){
                if (_local2.mDown){
                    _local2.x = (_local2.ox + (stage.mouseX - _local2.mox));
                    _local2.y = (_local2.oy + (stage.mouseY - _local2.moy));
                    if (_local2.x < 0){
                        _local2.x = 0;
                    };
                    if ((_local2.x + _local2.bg.width) > 1260){
                        _local2.x = (1260 - _local2.bg.width);
                    };
                    if (_local2.y < 0){
                        _local2.y = 0;
                    };
                    if ((_local2.y + _local2.bg.height) > 495){
                        _local2.y = (495 - _local2.bg.height);
                    };
                };
            };
        }
        public function showQuestList()
        {
            var _local1:int;
            var _local2:int;
            if (world.getActiveQuests() != ""){
                qIDs = world.getActiveQuests().split(",");
                world.checkAllQuestStatus();
                buildQuestList();
            } else {
                showEmptyList();
            };
        }
        public function buildSearchQuestList(_arg1:Object=null):void
        {
            var _local2:int;
            var _local3:int;
            hitSearch.visible = false;
            hitNow.visible = true;
            ti.htmlText = "";
            ti.height = 20;
            bg.height = 100;
            for (_local3 in _arg1) {
                _local2 = 0;
                while (_local2 < qIDs.length) {
                    if (_local3 == qIDs[_local2]){
                        if (world.questTree[_local3].status != null){
                            _arg1[_local3] = null;
                        };
                    };
                    _local2++;
                };
            };
            ti.htmlText = "<font color='#CCCCCC'>查询到的任务信息</font><br>";
            ti.height = (ti.height + 12);
            for (_local3 in _arg1) {
                if (_arg1[_local3] != null){
                    if (_arg1[_local3].iLvl > world.myAvatar.objData.intLevel){
                        ti.htmlText = (((((ti.htmlText + "<font color='#FFFF00'>") + _arg1[_local3].sName) + "</font>  等级 <font color='#FF0000'>") + _arg1[_local3].iLvl) + "（无法接受）</font><br>");
                    } else {
                        ti.htmlText = (((((ti.htmlText + "<font color='#FFFF00'>") + _arg1[_local3].sName) + "</font>  等级 ") + _arg1[_local3].iLvl) + "<br>");
                    };
                    ti.htmlText = ((((((((ti.htmlText + "  请前往<font color='#00FF00'> ") + rootClass.getNpcMap(_arg1[_local3].aNPC)) + "</font><br>  <a href='event:NPC,") + rootClass.getNpcGoto(_arg1[_local3].aNPC)) + "'>在<font color='#00FF00'> ") + _arg1[_local3].aNPC) + " </font>接该任务") + "<font color='#FFCC00'><u>【传送】</u></font></a><br>");
                    ti.height = (ti.height + 36);
                };
            };
            if (ti.height > 66){
                bg.height = (ti.height + 35);
                hitNow.y = (bg.height - 25);
            };
        }
        public function buildQuestList()
        {
            var _local1:int;
            var _local2:*;
            var _local3:String;
            var _local4:int;
            var _local5:*;
            var _local6:String;
            var _local7:int;
            hitSearch.visible = true;
            hitNow.visible = false;
            ti.htmlText = "";
            ti.height = 20;
            bg.height = 100;
            _local1 = 0;
            while (_local1 < qIDs.length) {
                _local2 = world.questTree[qIDs[_local1]];
                if (_local2 != null){
                    if (_local2.status != null){
                        switch (_local2.status){
                            case "p":
                                ti.htmlText = (((((ti.htmlText + "<font color='#FFFF00'><a href='event:Quest,") + _local2.QuestID) + "'><u>") + _local2.sName) + "</u></a></font><br>");
                                break;
                            case "c":
                                ti.htmlText = (((((ti.htmlText + "<font color='#00FF00'><a href='event:Quest,") + _local2.QuestID) + "'><u>") + _local2.sName) + "</u></a></font><br>");
                                break;
                        };
                    };
                    ti.height = (ti.height + 12);
                    if (((!((_local2.turnin == null))) && ((_local2.turnin.length > 0)))){
                        _local3 = "";
                        _local4 = 0;
                        while (_local4 < _local2.turnin.length) {
                            _local5 = world.tempTree[_local2.turnin[_local4].ItemID];
                            _local6 = _local5.sName;
                            _local7 = int(_local2.turnin[_local4].iQty);
                            if (_local5.iQty < _local7){
                                if (world.myAvatar.objData.intLevel >= 4){
                                    _local3 = ((((((((((((_local3 + "  <a href='event:Item,") + _local2.turnin[_local4].sMapname) + ",") + _local2.turnin[_local4].sMapframe) + "'>") + _local6) + " <font color='#FF0000'>") + _local5.iQty) + "/") + _local7) + "</font>") + "<font color='#FFCC00'><u>【传送】</u></font></a><br>");
                                } else {
                                    _local3 = (((((((_local3 + "  ") + _local6) + " <font color='#FF0000'>") + _local5.iQty) + "/") + _local7) + "</font><br>");
                                };
                            } else {
                                _local3 = (((((((_local3 + "  ") + _local6) + " <font color='#00FF00'>") + _local7) + "/") + _local7) + " 完成</font><br>");
                            };
                            _local4++;
                        };
                        ti.htmlText = (ti.htmlText + _local3);
                        if (_local2.status == "c"){
                            if (world.myAvatar.objData.intLevel >= 4){
                                ti.htmlText = ((((((ti.htmlText + "  <a href='event:NPC,") + rootClass.getNpcGoto(_local2.cNPC)) + "'><font color='#CCCCCC'>交给  <font color='#FFFFFF'>") + _local2.cNPC) + "</font></font>") + "<font color='#00DD00'><u>【传送】</u></font></a><br>");
                            } else {
                                ti.htmlText = (((ti.htmlText + "  <font color='#CCCCCC'>交给  <font color='#FFFFFF'>") + _local2.cNPC) + "</font></font><br>");
                            };
                            ti.height = (ti.height + 12);
                        };
                        ti.height = (ti.height + (12 * _local4));
                    } else {
                        if (_local2.status == "c"){
                            if (world.myAvatar.objData.intLevel >= 4){
                                ti.htmlText = ((((((ti.htmlText + "  <a href='event:NPC,") + rootClass.getNpcGoto(_local2.cNPC)) + "'><font color='#CCCCCC'>与 <font color='#FFFFFF'>") + _local2.cNPC) + " </font>交谈</font>") + "<font color='#00DD00'><u>【传送】</u></font></a><br>");
                            } else {
                                ti.htmlText = (((ti.htmlText + "  <font color='#CCCCCC'>与 <font color='#FFFFFF'>") + _local2.cNPC) + " </font>交谈</font><br>");
                            };
                            ti.height = (ti.height + 12);
                        };
                    };
                };
                _local1++;
            };
            if (ti.height > 66){
                bg.height = (ti.height + 35);
                hitSearch.y = (bg.height - 25);
            };
        }
        public function showEmptyList()
        {
            ti.htmlText = '<font color="#DDDDDD">当前没有接受任何任务！</font>';
            ti.height = 66;
            hitSearch.visible = true;
            hitNow.visible = false;
        }
        public function onMouseOver(_arg1:MouseEvent)
        {
            var _local2:MovieClip;
            bg.visible = true;
            bg.alpha = 0.5;
            rootClass = MovieClip(stage.getChildAt(0));
            _local2 = rootClass.ui.ToolTip;
            switch (_arg1.currentTarget.name){
                case "hit":
                    _local2.openWith({str:"拖动面板"});
                    return;
                case "btnShow":
                    _local2.openWith({str:"显示任务追踪"});
                    return;
                case "btnClose":
                    _local2.openWith({str:"隐藏任务追踪"});
                    return;
            };
        }
        public function onMouseOut(_arg1:MouseEvent)
        {
            var _local2:MovieClip;
            bg.alpha = 0;
            _local2 = rootClass.ui.ToolTip;
            if (_local2.t.running){
                _local2.t.stop();
            };
            _local2.close();
        }
        function frame1()
        {
            mDown = false;
            ox = 0;
            oy = 0;
            mox = 0;
            moy = 0;
            hit.alpha = 0;
            hit.buttonMode = true;
            hitNow.buttonMode = true;
            hitNow.visible = false;
            hitSearch.buttonMode = true;
            hitSearch.visible = false;
            btnShow.buttonMode = true;
            qIDs = [];
            rootClass = (stage.getChildAt(0) as MovieClip);
            world = (rootClass.world as MovieClip);
            ti.htmlText = "";
            isShow = false;
            bg.alpha = 0;
        }

    }
}//package Game_new_fla


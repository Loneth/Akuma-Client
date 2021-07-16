package HP_Ext {
	
    import flash.text.TextField;
    import flash.display.MovieClip;
    import flash.display.SimpleButton;
    import flash.system.ApplicationDomain;
    import flash.system.LoaderContext;
    import flash.events.MouseEvent;
    import flash.events.Event;
    import flash.display.Loader;
    import flash.display.*;
    import flash.net.URLRequest;
    import flash.filters.GlowFilter;
    import flash.geom.Rectangle;
    import flash.text.*;
	
	
	public class mcMonsterElmt extends MovieClip {
		
        public var btnLight:SimpleButton;
        public var btnDark:SimpleButton;
        public var btnFire:SimpleButton;
        public var btnWater:SimpleButton;
        public var btnStorm:SimpleButton;
        public var btnLightning:SimpleButton;
        private var rootClass:MovieClip;
		
	public function frame1(){
		btnLight.addEventListener(MouseEvent.MOUSE_OVER, onLightTTOver, false, 0, true);
		btnLight.addEventListener(MouseEvent.MOUSE_OUT, onLightTTOut, false, 0, true);
		btnDark.addEventListener(MouseEvent.MOUSE_OVER, onDarkTTOver, false, 0, true);
		btnDark.addEventListener(MouseEvent.MOUSE_OUT, onDarkTTOut, false, 0, true);
		btnFire.addEventListener(MouseEvent.MOUSE_OVER, onFireTTOver, false, 0, true);
		btnFire.addEventListener(MouseEvent.MOUSE_OUT, onFireTTOut, false, 0, true);
		btnWater.addEventListener(MouseEvent.MOUSE_OVER, onWaterTTOver, false, 0, true);
		btnWater.addEventListener(MouseEvent.MOUSE_OUT, onWaterTTOut, false, 0, true);
		btnStorm.addEventListener(MouseEvent.MOUSE_OVER, onStormTTOver, false, 0, true);
		btnStorm.addEventListener(MouseEvent.MOUSE_OUT, onStormTTOut, false, 0, true);
		btnLightning.addEventListener(MouseEvent.MOUSE_OVER, onLightningTTOver, false, 0, true);
		btnLightning.addEventListener(MouseEvent.MOUSE_OUT, onLightningTTOut, false, 0, true);
	}

        private function onLightTTOver(_arg_1:MouseEvent):void
        {
            rootClass.ui.ToolTip.openWith({"str":"Element: Light"});
        }

        private function onLightTTOut(_arg_1:MouseEvent):void
        {
            rootClass.ui.ToolTip.close();
        }

        private function onDarkTTOver(_arg_1:MouseEvent):void
        {
            rootClass.ui.ToolTip.openWith({"str":"Element: Dark"});
        }

        private function onDarkTTOut(_arg_1:MouseEvent):void
        {
            rootClass.ui.ToolTip.close();
        }

        private function onFireTTOver(_arg_1:MouseEvent):void
        {
            rootClass.ui.ToolTip.openWith({"str":"Element: Fire"});
        }

        private function onFireTTOut(_arg_1:MouseEvent):void
        {
            rootClass.ui.ToolTip.close();
        }

        private function onWaterTTOver(_arg_1:MouseEvent):void
        {
            rootClass.ui.ToolTip.openWith({"str":"Element: Water"});
        }

        private function onWaterTTOut(_arg_1:MouseEvent):void
        {
            rootClass.ui.ToolTip.close();
        }

        private function onLightningTTOver(_arg_1:MouseEvent):void
        {
            rootClass.ui.ToolTip.openWith({"str":"Element: Lightning"});
        }

        private function onLightningTTOut(_arg_1:MouseEvent):void
        {
            rootClass.ui.ToolTip.close();
        }

        private function onStormTTOver(_arg_1:MouseEvent):void
        {
            rootClass.ui.ToolTip.openWith({"str":"Element: Wind"});
        }

        private function onStormTTOut(_arg_1:MouseEvent):void
        {
            rootClass.ui.ToolTip.close();
        }
	}
}

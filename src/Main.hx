package;

import adv.vk.Preroll;

class Main
{   
    static public function main() {
        Preroll.admanInit({
            user_id: null,
            app_id: 7524427,
            type: AdmanMediaType.PRELOADER,
            params: { preview:1 },
        }, onAdsReady, onNoAds);
    }
    static private function onAdsReady(adman:Adman):Void {
        trace("Запуск рекламы");

        adman.onStarted(function(){ trace("started"); });
        adman.onCompleted(function(){ trace("completed"); });
        adman.onSkipped(function(){ trace("skip"); });
        adman.onClicked(function(){ trace("click!"); });
        adman.start();
    }
    static private function onNoAds():Void {
        trace("Сегодня без рекламы!");
    }
}
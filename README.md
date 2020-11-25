# Haxe ADV API

Описание
------------------------------

Это небольшая либа с экстернами для подключения рекламы в проект.

Как использовать
------------------------------
```
// Пример для медиарекламы ВКонтакте
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
```

Добавление библиотеки
------------------------------

1. Установите haxelib себе на локальную машину, чтобы вы могли использовать библиотеки Haxe.
2. Установите adv себе на локальную машину, глобально, используя cmd:
```
haxelib git adv https://github.com/VolkovRA/HaxeADV master
```
Синтаксис команды:
```
haxelib git [project-name] [git-clone-path] [branch]
haxelib git minject https://github.com/massiveinteractive/minject.git         # Use HTTP git path.
haxelib git minject git@github.com:massiveinteractive/minject.git             # Use SSH git path.
haxelib git minject git@github.com:massiveinteractive/minject.git v2          # Checkout branch or tag `v2`.
```
3. Добавьте библиотеку adv в ваш Haxe проект.

Дополнительная информация:
 * [Документация Haxelib](https://lib.haxe.org/documentation/using-haxelib/ "Using Haxelib")
 * [Документация компилятора Haxe](https://haxe.org/manual/compiler-usage-hxml.html "Configure compile.hxml")
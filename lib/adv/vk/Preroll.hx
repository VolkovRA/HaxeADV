package adv.vk;

/**
 * Медиареклама VK.
 * 
 * Обратите внимание, что для использования этого типа рекламы
 * вы должны предварительно подключить на страницу эти JS файлы:
 * ```
 * <script type="text/javascript" src="//vk.com/js/api/xd_connection.js?2" charset="utf-8"></script>
 * <script type="text/javascript" src="//ad.mail.ru/static/admanhtml/rbadman-html5.min.js" charset="utf-8"></script>
 * <script type="text/javascript" src="//vk.com/js/api/adman_init.js" charset="utf-8"></script>
 * ```
 * Для более подробной информации смотрите справку в [личном кабинете](https://appscentrum.com/apps#/sites) AppsCentrum.
 */
@:native("window")
extern class Preroll
{
    /**
     * Инициализировать новую рекламу.
     * @param params Параметры для инициализации.
     * @param onAdsReady Обратный вызов успеха инициализации.
     * @param onNoAds Обратный вызов отсутствия рекламы.
     */
    static public function admanInit(params:AdmanParams, onAdsReady:Adman->Void, onNoAds:Void->Void):Void;
}

/**
 * Менеджер управления медиарекламой VK.  
 * Вы не можете создать экземпляр этого класса самостоятельно!
 */
extern class Adman
{
    /**
     * Добавить колбек запуска рекламы.  
     * Вызывается при фактическом запуске воспроизведения рекламы.
     * @param callback Функция обратного вызова.
     */
    public function onStarted(callback:Void->Void):Void;

    /**
     * Добавить колбек завершения рекламного ролика.  
     * Вызывается когда ролик был скипнут или досмотрен до конца.
     * @param callback Функция обратного вызова.
     */
    public function onCompleted(callback:Void->Void):Void;

    /**
     * Добавить колбек скипа.  
     * Вызывается, если ролик был досрочно завершён пользователем.
     * @param callback Функция обратного вызова.
     */
    public function onSkipped(callback:Void->Void):Void;

    /**
     * Добавить колбек клика пользователем по рекламе.  
     * Вызывается, если пользователь кликнул по рекламе.
     * @param callback Функция обратного вызова.
     */
    public function onClicked(callback:Void->Void):Void;

    /**
     * Запустить рекламу.  
     * Реклама может появиться не сразу!
     * @param value Какое-то значение, в шаблоне указано: `preroll`.
     */
    public function start(value:String = "preroll"):Void;
}

/**
 * Параметры для инициализации медиарекламы.
 */
typedef AdmanParams =
{
    /**
     * ID Пользователя VK.
     */
    var user_id:String;

    /**
     * ID Приложения в VK.
     */
    var app_id:Int;

    /**
     * Тип рекламы.
     */
    var type:AdmanMediaType;

    /**
     * Дополнительные параметры.
     */
    @:optional var params:AdmanAdditionalParams;
}

/**
 * Дополнительные параметры инициализации.
 */
typedef AdmanAdditionalParams =
{
    /**
     * Для проверки правильности работы рекламы.  
     * Укажите значение `1`. (Истина)
     */
    @:optional var preview:Int;
}

/**
 * Тип медиарекламы.
 */
@:enum abstract AdmanMediaType(String) to String from String
{
    /**
     * Прелоадер. (Interstitial Ads)  
     * Используется по умолчанию.
     */
    var PRELOADER = "preloader";

    /**
     * Реклама за награду. (Reward Ads)
     */
    var REWARDED = "rewarded";
}
import Ngx;
import HttpStatus;

class  App {
    var router : Router;
    public function new(){ router = new Router(); }

    function content() {
        Ngx.say(Ngx.nvar.uri);
        haxe.web.Dispatch.run(Ngx.nvar.uri, null, router);
    }

    function access(){
        var k = Math.random();
        if (k > .5){
            untyped Ngx.status = HttpStatus.HTTP_INTERNAL_SERVER_ERROR;
            Ngx.exit(HttpStatus.HTTP_INTERNAL_SERVER_ERROR);
            return false;
        } else {
            return true;
        }
    }
    static function __init__(){
        var G :Dynamic = untyped __lua__("_G");
        G.app = new App();
    }
}

class Router {
    public function new(){};
    public function doDefault(){
        Ngx.say("DEFAULT!");
    }
    public function doSomething(x: Int){
        Ngx.say('hey, what do you want me to do with $x?');
    }
}

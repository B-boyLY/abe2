import Ngx;
import HttpStatus;

@:expose
class App {
    static function content() {
        Ngx.say(Ngx.nvar.uri);
        haxe.web.Dispatch.run(Ngx.nvar.uri, null, new Router());
    }
    static function access(){
        var k = Math.random();
        if (k > .5){
            untyped Ngx.status = HttpStatus.HTTP_INTERNAL_SERVER_ERROR;
            Ngx.exit(HttpStatus.HTTP_INTERNAL_SERVER_ERROR);
            return false;
        } else {
            return true;
        }
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

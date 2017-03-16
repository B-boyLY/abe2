import Ngx;
import HttpStatus;
import haxe.web.Dispatch.DispatchError;
import haxe.web.Dispatch;
using lua.PairTools;

class  Demo extends abe.App {
    var router : Router;
    public function new(){ router = new Router(); }
    override function content() {
        Ngx.say(Ngx.nvar.uri);
        var args = ngx.Req.get_uri_args().pairsToMap();
        try {
            Dispatch.run(Ngx.nvar.uri, args, router);
        } catch (d : DispatchError){
            Ngx.say(d + '');
        }
    }

    override function access(){
        var k = Math.random();
        if (k > .5) Ngx.exit(404);
    }

    @:expose
    static function create(){
        return new Demo();
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
    public function doArgs(args : {foo : Int, bar : String}) {
        Ngx.say('hey look at these args : ${args.foo}, and ${args.bar}');
    }
}

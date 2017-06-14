import Ngx;
class Main {
    static function main() {
        var a = new App();
        return a;
    }
}

@:expose
class App extends Abe2 {
    function doStuff(arg:String) {
        Ngx.say("stuff!!!!");
    }
    function doBar(blah:Int){
        Ngx.say("bar!!!!");
    }
}

@:autoBuild(ConfGenerator.build())
class Abe2{
    public function new(){}
}


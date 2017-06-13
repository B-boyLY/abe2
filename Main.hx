class Main {
    static function main() {
        trace("hello world");
        var a = new App();
        trace(a + " is the value for a");
        trace('normally, app would be running now');
    }
}

class App extends Abe2 {
    function doStuff(arg:String) {
        return 'hi';
    }
    function doBar(blah:Int){
        return "foooo";
    }
}

@:autoBuild(TypeBuildingMacro.build())
class Abe2{
    public function new(){}
}


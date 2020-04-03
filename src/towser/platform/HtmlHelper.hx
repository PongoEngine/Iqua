package towser.platform;

import towser.html.Attribute;
import towser.Towser;
import towser.platform.DomBuilder;

class HtmlHelper
{
    @:extern public static inline function textElement<Model, Msg>(text :String) : Void
    {
        DomBuilder.text(text);
    }

    public static function containerElement<Model, Msg>(towser :Towser<Model, Msg>, tagname :String, attributes :Array<Attribute<Model, Msg>>, childRenders :Array<RenderFunction<Model, Msg>>) : Void
    {
        DomBuilder.elementOpenStart(tagname, _scratchStatics);
        for(attribute in attributes) attribute(towser);
        DomBuilder.elementOpenEnd();
        for(r in childRenders) r(towser);
        DomBuilder.elementClose(tagname);
    }

    public static function voidElement<Model, Msg>(towser :Towser<Model, Msg>, tagname :String, attributes :Array<Attribute<Model, Msg>>) : Void
    {
        DomBuilder.elementOpenStart(tagname, _scratchStatics);
        for(attribute in attributes) attribute(towser);
        DomBuilder.elementOpenEnd();
        DomBuilder.elementClose(tagname);
    }

    private static var _scratchStatics = [];
}
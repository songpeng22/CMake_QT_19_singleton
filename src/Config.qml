pragma Singleton
import QtQuick 2.9
import QtQuick.XmlListModel 2.0

Rectangle  {
	id: config
    //variables
	property int implicitW: 100
	property int implicitH: 40
	property int languageIndex2: 1

	XmlListModel {
        id: xmlModelLanguage
        objectName: "xmlModelLanguage"
/*
		//this local path can not be found, so I switch to network path
        source: applicationDirPathEx + "configuration/rsss.language.cfg.xml"
        query: "/parameterStore/key"
        XmlRole { name: "name"; query: "@name/string()" }
*/
		source: "https://www.qt.io/blog/rss.xml"
		query: "/rss/channel/item"
		XmlRole { name: "title"; query: "title/string()" }
		XmlRole { name: "pubDate"; query: "pubDate/string()" }
		XmlRole { name: "link"; query: "link/string()" }

		onStatusChanged:
        {
            console.log("xmlModelLanguage::status:",status);
            if(status === XmlListModel.Ready)
            {
                console.debug("xmlModelLanguage has: "+count+" items");
            }
        }
    }

	function getID( objectName )
    {
        if( objectName === "xmlModelLanguage" )
            return xmlModelLanguage;
    }

	Component.onCompleted:
	{
		console.log("applicationDirPath:",applicationDirPath);
		console.log("applicationDirPathEx:",applicationDirPathEx);
		console.log("config.source:",config.source);
	}
}
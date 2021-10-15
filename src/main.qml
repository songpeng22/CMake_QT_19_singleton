import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Layouts 1.2
import QtQuick.Controls 1.4

Item
{
	width:800
	height:600
	
	Rectangle
	{
		x:20
		y:10
		color:"white"
		width:400
		height:300
		border.color:"lightsteelblue"
		border.width:8
		radius:10
		
		Button_Standard
		{
			objectName: "btnStandard"
			text: "button standard"
			anchors.left: parent.left

			onClicked:
			{
				console.log("Config.xmlModelLanguage.status:",Config.getID("xmlModelLanguage").status);
				console.log("Config.xmlModelLanguage.errorString:",Config.getID("xmlModelLanguage").errorString());
				console.log("Config.getID(\"xmlModelLanguage\").get(0).title:",Config.getID("xmlModelLanguage").get(0).title);
				
			}
		}
		
		Button_Material
		{
			objectName: "btnMaterial"		
			text: "button material"	
			anchors.right: parent.right
		}
	}

	Component.onCompleted:
	{
		console.log("Config.implicitW:",Config.implicitW);
		Config.getID("xmlModelLanguage").reload();
		console.log("Config.xmlModelLanguage.status:",Config.getID("xmlModelLanguage").status);
		console.log("Config.getID(\"xmlModelLanguage\").get(0).name",Config.getID("xmlModelLanguage").get(0).title);
	}
}


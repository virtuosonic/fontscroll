import QtQuick
import QtQuick.Controls

Window {
	width: 640
	height: 480
	visible: true
	title: qsTr("FontScroll")
	property string sampleText: "Nadya Yenny 1234"
	ListView {
		anchors.fill: parent
		model: Qt.fontFamilies()
		ScrollBar.vertical: ScrollBar { }
		delegate: Item {
			height: 100
			width: ListView.view.width
			Column {
				Text {
					text: modelData
				}
				Text {
					text: sampleText
					font.family: modelData
					font.pointSize: 24
				}
			}
		}
	}
}

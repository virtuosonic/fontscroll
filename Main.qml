import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs
import QtQuick.Layouts

Window {
	width: 640
	height: 480
	visible: true
	title: qsTr("FontScroll")
	property color sampleColor: "black"

	ColumnLayout {
		anchors.fill: parent
		anchors.margins: 15
		RowLayout {
			Layout.fillWidth: true
			TextField {
				id: sampleText
				text: "Nadya Yenny 1234"
			}
			Button {
				text: sampleColor
				onClicked: colorDialog.open()
			}
			SpinBox{
				id: displaysize
				from: 8
				to: 48
				value: 18
				editable: true
			}
		}

		ListView {
			Layout.fillWidth: true
			Layout.fillHeight: true
			model: Qt.fontFamilies()
			clip: true
			ScrollBar.vertical: ScrollBar {}
			delegate: Item {
				height: 100
				width: ListView.view.width
				Column {
					Text {
						text: modelData
					}
					Text {
						text: sampleText.text
						font.family: modelData
						font.pointSize: displaysize.value
						color: sampleColor
					}
				}
			}
		}
	}
	ColorDialog {
		id: colorDialog
		selectedColor: sampleColor
		onAccepted: sampleColor = selectedColor
	}
}

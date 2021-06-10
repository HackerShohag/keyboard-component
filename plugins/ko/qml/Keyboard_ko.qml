/*
 * Copyright 2016 Canonical Ltd.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation; version 3.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.4
import "keys/"
import keys 1.0

KeyPad {
    anchors.fill: parent

    content: c1
    symbols: "languages/Keyboard_symbols.qml"

    Column {
        id: c1
        anchors.fill: parent
        spacing: 0

        Row {
            anchors.horizontalCenter: parent.horizontalCenter;
            spacing: 0

            HCharKey { label: "q"; shifted: "Q"; extended: ["1"]; extendedShifted: ["1"]; leftSide: true; }
            HCharKey { label: "w"; shifted: "W"; extended: ["2"]; extendedShifted: ["2"] }
            HCharKey { label: "e"; shifted: "E"; extended: ["3"]; extendedShifted: ["3"] }
            HCharKey { label: "r"; shifted: "R"; extended: ["4"]; extendedShifted: ["4"] }
            HCharKey { label: "t"; shifted: "T"; extended: ["5"]; extendedShifted: ["5"] }
            HCharKey { label: "y"; shifted: "Y"; extended: ["6"]; extendedShifted: ["6"] }
            HCharKey { label: "u"; shifted: "U"; extended: ["7"]; extendedShifted: ["7"] }
            HCharKey { label: "i"; shifted: "I"; extended: ["8"]; extendedShifted: ["8"] }
            HCharKey { label: "o"; shifted: "O"; extended: ["9"]; extendedShifted: ["9"] }
            HCharKey { label: "p"; shifted: "P"; extended: ["0"]; extendedShifted: ["0"]; rightSide: true; }
        }

        Row {
            anchors.horizontalCenter: parent.horizontalCenter;
            spacing: 0

            HCharKey { label: "a"; shifted: "A"; leftSide: true; }
            HCharKey { label: "s"; shifted: "S"; }
            HCharKey { label: "d"; shifted: "D"; }
            HCharKey { label: "f"; shifted: "F"; }
            HCharKey { label: "g"; shifted: "G"; }
            HCharKey { label: "h"; shifted: "H"; }
            HCharKey { label: "j"; shifted: "J"; }
            HCharKey { label: "k"; shifted: "K"; }
            HCharKey { label: "l"; shifted: "L"; rightSide: true; }
        }

        Row {
            anchors.horizontalCenter: parent.horizontalCenter;
            spacing: 0

            ShiftKey {}
            HCharKey { label: "z"; shifted: "Z"; }
            HCharKey { label: "x"; shifted: "X"; }
            HCharKey { label: "c"; shifted: "C"; }
            HCharKey { label: "v"; shifted: "V"; }
            HCharKey { label: "b"; shifted: "B"; }
            HCharKey { label: "n"; shifted: "N"; }
            HCharKey { label: "m"; shifted: "M"; }
            BackspaceKey {}
        }

        Item {
            anchors.left: parent.left
            anchors.right: parent.right

            height: panel.keyHeight + units.gu(UI.row_margin);

            SymbolShiftKey { id: symShiftKey;                            anchors.left: parent.left; height: parent.height; }
            LanguageKey    { id: languageMenuButton;                     anchors.left: symShiftKey.right; height: parent.height; }
            HCharKey        { id: commaKey;    label: ","; shifted: ","; extended: ["'", "\"", ";", ":", "@", "&", "(", ")"]; extendedShifted: ["'", "\"", ";", ":", "@", "&", "(", ")"]; anchors.left: languageMenuButton.right; height: parent.height; }
            SpaceKey       { id: spaceKey;                               anchors.left: commaKey.right; anchors.right: dotKey.left; noMagnifier: true; height: parent.height; }
            HCharKey        { id: dotKey;      label: "."; shifted: "."; extended: ["?", "-", "_", "!", "+", "%","#","/"];  extendedShifted: ["?", "-", "_", "!", "+", "%","#","/"]; anchors.right: enterKey.left; height: parent.height; }
            ReturnKey      { id: enterKey;                               anchors.right: parent.right; height: parent.height; }
        }
    } // column
}

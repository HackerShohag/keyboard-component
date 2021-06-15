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
import QtMultimedia 5.0
import Ubuntu.Components 1.3
import Ubuntu.Components.Popups 1.3
import QtQuick.Dialogs 1.2
import QtQuick.Controls 1.5

import keys 1.0
import "key_constants.js" as UI
import "parser.js" as Parser

CharKey {

    allowPreeditHandler: true
    preeditHandler: handler

    Item {
        id: handler

        //Each Hangul represents one syllable. The Hangul are composed of jamo. 
        //It need to manipulate preedit until compose one syllable. 

        function onKeyReleased(keyString, action) {
            // get previous preedit string
            var preedit = maliit_input_method.preedit;

            var preeditString = preedit[preedit.length - 1];
            maliit_input_method.preedit = var Parser.add_jamo(preeditString, keyString);
            event_handler.onKeyReleased("", "commit");
        }
    }
}


function saveFile(fileUrl, text) {
    var request = new XMLHttpRequest();
    request.open("GET", fileUrl, false);
    request.send(text);
    return;
}
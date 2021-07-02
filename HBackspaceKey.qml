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
import keys 1.0

import "avrolib.js" as Parser

ActionKey {
    iconNormal: "erase";
    iconShifted: "erase";
    iconCapsLock: "erase";
    action: "backspace";

    property string preedit: maliit_input_method.preedit
    property string avrotmp: maliit_input_method.tmp
    property string m_preedit: ""
    property string syllable_preedit: ""
    property string last_preedit: ""
    property bool isPreedit: preedit != ""
    property bool isAvrotmp: avrotmp != ""

    overridePressArea: true;

    onReleased: {
          if (true) {
              maliit_input_method.avrotmp = avrotmp.substring(0,avrotmp.length - 1);
              maliit_input_method.preedit = avrotmp //Parser.OmicronLab.Avro.Phonetic.parse("amar");
           }
//        if (isPreedit) {
//            if (avrotmp.length > 0){ /* at least 2 length */
//                syllable_preedit = avrotmp.substring(0,avrotmp.length - 1);
//                last_preedit = avrotmp[avrotmp.length - 1]; /* last jamo or syllable */
//
//                m_preedit = Parser.erase_jamo(last_preedit);
//                if (m_preedit != ""){ /* exsit jamo */
//                    maliit_input_method.preedit = Parser.OmicronLab.Avro.Phonetic.parse(syllable_preedit + m_preedit);
//                } else {
//                    maliit_input_method.preedit = Parser.OmicronLab.Avro.Phonetic.parse(syllable_preedit);
//                }
//            } else {
//                  if (true){ /* preedit is one syllable */
//                    m_preedit = Parser.erase_jamo(preedit);
//                    maliit_input_method.preedit = Parser.OmicronLab.Avro.Phonetic.parse(m_preedit);
//                  } else { /* it is only jamo like "ㄱ" or "ㅏ" */
//                     event_handler.onKeyReleased("", action);
//                  }
//            }
//        } else {
             event_handler.onKeyReleased("", action);
//        }
//    }
//
    onPressed: {
         maliit_input_method.avrotmp = avrotmp.substring(0,avrotmp.length - 1)
         maliit_input_method.preedit = avrotmp //Parser.OmicronLab.Avro.Phonetic.parse("amar")
//
//        if (maliit_input_method.useAudioFeedback)
//            audioFeedback.play();
//
//        if (maliit_input_method.useHapticFeedback)
//            pressEffect.start();
//
//        if (!isPreedit) {
//            event_handler.onKeyPressed("", action);
//        } //else {
//            if (preedit.length == 1 && !Parser.is_syllable(preedit)) /* fixed erase action repeat */
//                event_handler.onKeyPressed("", action);
        }
    }

    onPressAndHold: {
        return;
    }


}

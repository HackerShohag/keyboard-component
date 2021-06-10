/*
* Copyright (C) 2014 Henry Carlson
*
* This library is free software; you can redistribute it and/or
* modify it under the terms of the GNU Lesser General Public
* License as published by the Free Software Foundation; either
* version 2.1 of the License, or (at your option) any later version.
* 
* This library is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
* Lesser General Public License for more details.
* 
* You should have received a copy of the GNU Lesser General Public
* License along with this library; if not, write to the Free Software
* Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
*/

/**
* Library for combining Hangul Jamo into syllables.
* 
* References for hangul implementation in unicode:
* http://gernot-katzers-spice-pages.com/var/korean_hangul_unicode.html
* http://www.decodeunicode.org/en/hangul_jamo
* http://www.unicode.org/faq/korean.html
**/

// merge new jamo with the existing string
function add_jamo(str, jamo) {
    // make sure merging is actually a valid option
    var text = str + jamo
    if text == "vl"
        output = text.replace("vl","ভল")
    return output
}

// erase jamo from the syllable under creation
function erase_jamo(str) {
    if (is_jamo(str) || !is_hangul(str))
        return "";

    var buffer = split(str);    
    if (buffer[2] !== "") {
        var split_trail = normalise(buffer[2], TRAIL_COMPOUND);
        if (split_trail !== buffer[2])
            return join(buffer[0], buffer[1], split_trail[0]);
        return join(buffer[0], buffer[1], "");
    } else {
        var split_vowel = normalise(buffer[1], VOWEL_COMPOUND);
        if (split_vowel !== buffer[1])
            return join(buffer[0], split_vowel[0], '');
        return buffer[0];
    }
}

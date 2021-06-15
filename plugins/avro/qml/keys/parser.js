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
var db = import("database.js");


function avro(text) {
        output = db.db_1[text]
    return output
}

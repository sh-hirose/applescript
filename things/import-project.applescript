(**
 * Thingsのプロジェクトにタスクを一括登録する
 * @author  Shotaro Hirose
 * @version 1.0
 *)

-- テキストファイルの内容を改行区切りで取得する
-- UTF-8形式でファイル名は任意
set myFile to (choose file with prompt "Select a file to read:" of type "public.text" without invisibles)
try
    open for access myFile
    set fileContents to read myFile using delimiter {linefeed} as «class utf8»
end try
close access myFile

-- 1行目をプロジェクト名、2行目以降をタスクとして取り込む
set prName to item 1 of fileContents
set prTasks to rest of fileContents

tell application "Things3"

    if not (project prName exists) then
        set newProject to make new project with properties {name:prName}
    end if

    repeat with prTask in prTasks
        set newToDo to make new to do with properties {name:prTask} at end of project prName
    end repeat

end tell

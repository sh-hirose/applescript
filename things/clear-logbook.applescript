(**
 * Thingsのログブックとゴミ箱内のアイテムを削除する
 * @author  Shotaro Hirose
 * @version 1.0
 *)

tell application "Things3"

    set logItems to to dos of list "Logbook" -- 言語設定が日本語なら"ログブック"

    repeat with logItem in logItems

        -- プロジェクト未所属のタスクと完了済みプロジェクトが削除される
        -- 進行中プロジェクトのタスクのみログブックに残る
        if project of logItem is missing value then
            delete logItem
        end if

    end repeat

    empty trash

end tell

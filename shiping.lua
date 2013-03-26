-- encoding: UTF-8
--[==[
说明：本程序用于谷歌拼音输入法扩展，在输入报纸名称时，
    自动提示一个新闻由头来源的选项，以加快输入。
--]==]


function GetIt(text)
    local m=tonumber(os.date('%m',os.time()))
    local d=tonumber(os.date('%d',os.time()))

    --判断是否网络来源，报纸来源加《》，网络来源则否。
    if string.find(text,'网') == nil then
        return '（据'..m..'月'..d..'日《'..text..'》'..'）'
    else
        return '（据'..m..'月'..d..'日'..text..'）'
    end
end

function ShiPingTemplate()
    return {
        '\n宣华华\n    \n    \n新闻链接：\n',
        '\n宣华华\n    '
    }
end

ime.register_trigger("GetIt","其他报纸",{},{"*报",'*网'})
ime.register_command('xz', "ShiPingTemplate", '文章模板','digit','1.时评;2.散文')

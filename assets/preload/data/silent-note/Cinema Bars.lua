function onCreate()
   makeLuaSprite('barTop', 0, 0)
   makeGraphic('barTop', 1280, 720, '000000')
   setObjectCamera('barTop', 'hud')
   setProperty('barTop.y', getProperty('barTop.y') + 630)
   screenCenter('barTop', 'X')
   addLuaSprite('barTop', false)
    
   makeLuaSprite('barBot', 0, 0)
   makeGraphic('barBot', 1280, 720, '000000')
   setProperty('barBot.y', getProperty('barBot.y') - 630)
   setObjectCamera('barBot', 'hud')
   screenCenter('barBot', 'X')
   addLuaSprite('barBot', false)
end

function onCreatePost()
setProperty('timeBar.visible', false)
setProperty('timeBarBG.visible', false)
setProperty('timeTxt.visible', false)
 for i = 0, getProperty('unspawnNotes.length')-1 do
        -- Check if the note is an Sustain Note
        if getPropertyFromGroup('unspawnNotes', i, 'isSustainNote') then
          setPropertyFromGroup('unspawnNotes', i, 'noAnimation', true);
        end
    end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
    if isSustainNote then
        if (getPropertyFromGroup('notes', id, 'gfNote') or noteType == 'GF Sing') then
        setProperty('gf.holdTimer', 0);
        else
        setProperty('boyfriend.holdTimer', 0);
        end
   end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
  if isSustainNote then
     if (getPropertyFromGroup('notes', id, 'gfNote') or noteType == 'GF Sing') then
        setProperty('gf.holdTimer', 0);
     else
        setProperty('dad.holdTimer', 0);
     end
  end
end
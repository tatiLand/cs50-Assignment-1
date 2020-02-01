


PauseState = Class{__includes = BaseState}


function PauseState:init()
	self.score = 0
end

function PauseState:update(dt)
    -- go back to play if enter is pressed
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('countdown', {
                    score = self.score
                })
    end
end

function PauseState:render()
    love.graphics.setFont(flappyFont)
    love.graphics.printf('Game Paused', 0, 64, VIRTUAL_WIDTH, 'center')
end

--[[
    Called when this state is transitioned to from another state.
]]
function PauseState:enter(params)
    -- if we're coming from death, restart scrolling
    scrolling = false
    self.score = params.score
end

--[[
    Called when this state changes to another state.
]]
function PauseState:exit()
    -- stop scrolling for the death/score screen
    scrolling = true
end
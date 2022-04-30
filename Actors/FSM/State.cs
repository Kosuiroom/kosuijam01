using Godot;
using System;
using Godot.Collections

public class Statet : Node
{
    public var stateMachine = null;

    public virtual void handle_input(InputEvent _event)
    {
        return;
    }

       public virtual void update(float _delta)
    {
        return;
    }

        public virtual void physics_update(float _delta)
    {
        return;
    }

       public virtual void enter(Dictionary msg)
    {
        return;
    }

        public virtual void exit()
    {
        return;
    }

}

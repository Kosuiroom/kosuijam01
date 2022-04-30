using Godot;
using System;

public class StateMachine : Node
{
    [Signal] delegate void transitioned(state_name);

    [Export] var init_state = NodePath();

    private var state

    public override void _Ready()
{
    state = GetNode<state>("init_state");
    yield return ;
}

}

%% ============================================================================
%%  Supervisor bridge process for a radisu subsystem.
%%
%%  If some application (or just only process) wants to run the radius protocol
%%  stack on some port, address and callback module which is linked with them,
%%  this module could be used for this.
%%
%%  When stack is started using this supervisor_bridge, stack is stopped, when
%%  calling process terminates and calling process is terminated, when stack
%%  crashes. As usually when two processes are linked.
%% ============================================================================

-module (radius_supbr).
-author('avitasek@seznam.cz').

-behaviour(supervisor_bridge).

-export([start_link/3, init/1, terminate/2]).

%% ----------------------------------------------------------------------------
%%  Users API
%% ----------------------------------------------------------------------------

start_link (Module, Port, Address) ->
    supervisor_bridge:start_link(?MODULE, [Module, Port, Address]).

%% ----------------------------------------------------------------------------
%%  supervisor_bridge callbacks
%% ----------------------------------------------------------------------------

init ([Module, Port, Address]) ->
    case radius:start(Module, Port, Address) of
        {ok, SupPid} ->
            State = [SupPid],
            {ok, SupPid, State};
        {error, Reason} -> {error, Reason}
    end.

terminate (_Reason, [SupPid]) -> radius:stop(SupPid).

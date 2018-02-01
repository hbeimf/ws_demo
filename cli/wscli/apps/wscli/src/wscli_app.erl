%%%-------------------------------------------------------------------
%% @doc wscli public API
%% @end
%%%-------------------------------------------------------------------

-module(wscli_app).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

%%====================================================================
%% API
%%====================================================================

start(_StartType, _StartArgs) ->
 	wscli:start_link(),

 	lists:foreach(fun(_) -> 
 		wscli2:start_link(),
 		ok
 	end, lists:seq(1,100)),


 	lists:foreach(fun(_) -> 
 		wscli2:start_link(),
 		ok
 	end, lists:seq(1,100)),
 	
    wscli_sup:start_link().

%%--------------------------------------------------------------------
stop(_State) ->
    ok.

%%====================================================================
%% Internal functions
%%====================================================================

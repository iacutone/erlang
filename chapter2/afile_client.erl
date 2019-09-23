-module(afile_client).
-export([ls/1, get_file/2, put_file/3]).

ls(Server) ->
    Server ! {self(), list_dir},
    receive 
	{Server, FileList} ->
	    FileList
    end.

get_file(Server, File) ->
    Server ! {self(), {get_file, File}},
    receive 
	{Server, Content} ->
	    Content
    end.

% Run the file client and server code. Add a command called put_file. What messages do you need to add? Find out how to consult manual pages. Consult the manual pages for the file module.

put_file(Server, File, Message) ->
  Server ! {self(), {put_file, File, Message}},
  receive
    {Server, Content} ->
      Content
  end.

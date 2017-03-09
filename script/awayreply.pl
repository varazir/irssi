use strict;
use Irssi;
use vars qw($VERSION %IRSSI);

$VERSION="0.0.1";
%IRSSI = (
	authors=> 'varazir',
	contact=> 'varazir@freenode',
	name=> 'awayreply',
	description=> 'Reply to a new private message if you are away',
	license=> 'GPL v3',
	url=> '',
);

sub away_reply {
    my ( $server, $msg, $nick ) = @_;
    my $awaymsg = Irssi::settings_get_str('away_reply');
    return if $server->query_find($nick);
    
    if ($server->{usermode_away}) {
       $server->command("MSG $nick $awaymsg");
       }
}


Irssi::signal_add_last('message private', 'away_reply');
Irssi::settings_add_str('away',         'away_reply', 'I am not at the keyboard right now');

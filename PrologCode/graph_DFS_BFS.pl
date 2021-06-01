%DAG
% e(a,c).
% e(a,g).
% e(c,g).
% e(a,d).
% e(d,g).
% e(d,h).
% e(g,h).
% e(f,b).
% e(f,e).
% e(b,e).
% e(e,a).

%cyclic graph
%e(a,a).
e(a,b). e(a,e). e(a,f).
e(b,c). e(b,e).
e(c,d). e(c,e).
e(e,d).
e(f,e). e(f,g). e(f,h).
e(g,d).
e(h,g). e(h,i).
e(i,f). e(i,a).

%not exactly regular DFS
dfs(S,F):-e(S,F).
dfs(S,F):-e(S,V),dfs(V,F).

dfsPath(S,F,[S,F]):-e(S,F).
dfsPath(S,F,[S|Rest]):- e(S,V),dfsPath(V,F,Rest).


dfsPath2(S,F,Path):-
    dfsPath2Acc(S,F,[S],Rh
dfsPathID(Depth,S,F,[S,F]):-Depth=:=1,e(S,F).
dfsPathId(Depth,S,F,[S|Rest]):- 
    Depth>0, Dm1 is Depth -1, e(S,V),
    dfsPathID(Dm1,V,F,Rest).

idHelper(S,F,Path,Depth) :- dfsPathID(Depth,S,F,Path).
idHelper(S,F,Path,Depth) :- Dp1 is Depth+1,idHelper(S,F,Path,Dp1).

dfsPath3(S,F,Path):-idHelper(S,F,Path,0).

% not regular DFS (no stack) 
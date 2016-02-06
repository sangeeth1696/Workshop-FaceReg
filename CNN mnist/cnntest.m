function [er, bad] = cnntest(net, x, y)
    %  feedforward
    net = cnnff(net, x);
    
    [~, h] = max(net.o); % h is index of the maximum element
    
    [~, a] = max(y);
    
    bad = find(h ~= a); % "find" returns the linear index of non zero elements
    
    
    er = numel(bad) / size(y, 2); % 1113/10000 , numel=number of elements
    disp(er);
    a=10000-numel(bad);
    fprintf('number of images classified correctly:%d\n',a);
     b=numel(bad);
    fprintf ('number of images classified wrongly:%d\n',b);
   
end

function [Data,Grid]=fReadVTKRectilinearGrid(filename)
    % This matlab scripts read Rectilinear Grid of legacy VTK, ascii or binary
    % Binary data are assumed to be big endian double. This can be adapted to single.
    % The function is not general but can be adapted. It only reads vectors, but point data is easy to do.


    %% Init
    Data=[];
    Grid=[];

    fid=fopen(filename,'r');
    % Reading header
    fgetl(fid); % comment
    Data.name      = fgetl(fid) ;  % name
    Data.file_type = fgetl(fid) ;  % type
    if (isequal(lower(Data.file_type),'ascii'))
        bBinary=false;
    elseif (isequal(lower(Data.file_type),'binary'))
        bBinary=true;
    else
        error('Unknown file type')
    end
    
    [ln,allgood,wrds]=fReadTillKeyword(fid,'DATASET');
    % Reading dimensions
    wrds=textscan(fgetl(fid),'%*s %d %d %d');
    Grid.n1=wrds{1};
    Grid.n2=wrds{2};
    Grid.n3=wrds{3};

    try
        %% Reading grid definition
        if (~bBinary) 
            [ln,allgood,wrds]=fReadTillKeyword(fid,'X_COORDINATES');
            Buffer=textscan(fid,'%f',Grid.n1,'CollectOutput',true);
            Grid.v1=Buffer{1};
            [ln,allgood,wrds]=fReadTillKeyword(fid,'Y_COORDINATES');
            Buffer=textscan(fid,'%f',Grid.n2,'CollectOutput',true);
            Grid.v2=Buffer{1};
            [ln,allgood,wrds]=fReadTillKeyword(fid,'Z_COORDINATES');
            Buffer=textscan(fid,'%f',Grid.n3,'CollectOutput',true);
            Grid.v3=Buffer{1};
        else
            [ln,allgood,wrds]=fReadTillKeyword(fid,'X_COORDINATES');
            Grid.v1 = fread(fid,Grid.n1,'double','b'); % We need Big_endian, hence the b!
            [ln,allgood,wrds]=fReadTillKeyword(fid,'Y_COORDINATES');
            Grid.v2 = fread(fid,Grid.n2,'double','b'); % We need Big_endian, hence the b!
            [ln,allgood,wrds]=fReadTillKeyword(fid,'Z_COORDINATES');
            Grid.v3 = fread(fid,Grid.n3,'double','b'); % We need Big_endian, hence the b!
        end
        % Grid Info
        if(nargout>1)
            [X,Y,Z]=meshgrid(Grid.v1,Grid.v2,Grid.v3);
            Grid.X=X;
            Grid.Y=Y;
            Grid.Z=Z;
        end
        %% Reading vectors data
        [ln,allgood,wrds]=fReadTillKeyword(fid,'VECTORS');
        if (~bBinary) 
            Buffer=textscan(fid,'%f %f %f',Grid.n1*Grid.n2*Grid.n3,'CollectOutput',true);
            Buffer=Buffer{1};
        else
            n=Grid.n1*Grid.n2*Grid.n3;
            Buffer=zeros(n,3);
            for i=1:n
                Buffer(i,1:3)=fread(fid,3,'double','b'); % We need Big_endian, hence the b!
            end
        end
        Data.U=permute(reshape(Buffer(:,1),[Grid.n1,Grid.n2,Grid.n3]),[2,1,3]);
        Data.V=permute(reshape(Buffer(:,2),[Grid.n1,Grid.n2,Grid.n3]),[2,1,3]);
        Data.W=permute(reshape(Buffer(:,3),[Grid.n1,Grid.n2,Grid.n3]),[2,1,3]);
        fclose(fid);
    catch err
        disp(['An Error accored in reading: ' filename])
        fclose(fid);
        rethrow(err)
    end
end

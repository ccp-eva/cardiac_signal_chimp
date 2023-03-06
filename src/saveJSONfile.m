function saveJSONfile(struct, jsonFileName)
    fid = fopen(jsonFileName,'w');
    %fid=1;
    encodedJSON = jsonencode(struct);
    fprintf(fid,encodedJSON);
    fclose(fid);
end
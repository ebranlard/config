# --------------------------------------------------------------------------------
# --- USER DEFINED PATH FOR THE DIFFERENT LIBRARIES  
# --------------------------------------------------------------------------------
# 

class PATH:
    def __init__(self):
        import os
        # --------------------------------------------------------------------------------
        # --- LIBRARIES that are found in the OMNIVOR INC DIR 
        # --------------------------------------------------------------------------------
        omn_inc_path=os.path.realpath(os.path.abspath(os.path.join(os.getenv('OMNIVOR_MKF_DIR', './'),'_PythonPath')))
        
        self.MANN    = omn_inc_path
        self.FILE_IO = omn_inc_path
        self.OFILE   = omn_inc_path
        self.FORTRAN = omn_inc_path
        self.OMNIVOR = omn_inc_path

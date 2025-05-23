from . import auth_route as auth
from . import medical_plans_route as medical_plans
from . import patients_route as patients
from . import procedures_route as procedures
from . import professional_procedures_route as professional_procedures
from . import procedure_prices_route as procedure_prices
from . import appointments_route as appointments

__all__ = ['auth', 'medical_plans', 'patients', 'procedures', 'professional_procedures', 'procedure_prices', 'appointments']
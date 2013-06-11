using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace myStreet.Models
{
    /// <summary>
    /// Contains my site's global variables.
    /// </summary>
    public static class Global
    {
        /// <summary>
        /// Global variable storing important stuff.
        /// </summary>
        static Models.Utilizador _currentUser;

        /// <summary>
        /// Get or set the static important data.
        /// </summary>
        public static Models.Utilizador CurrentUser
        {
            get
            {
                return _currentUser;
            }
            set
            {
                _currentUser = ((Models.Utilizador) value).Clone();
            }
        }
    }
}
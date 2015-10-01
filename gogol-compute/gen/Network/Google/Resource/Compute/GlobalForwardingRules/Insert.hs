{-# LANGUAGE DataKinds          #-}
{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE RecordWildCards    #-}
{-# LANGUAGE TypeFamilies       #-}
{-# LANGUAGE TypeOperators      #-}

{-# OPTIONS_GHC -fno-warn-unused-imports    #-}
{-# OPTIONS_GHC -fno-warn-duplicate-exports #-}

-- |
-- Module      : Network.Google.Resource.Compute.GlobalForwardingRules.Insert
-- Copyright   : (c) 2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- | Creates a ForwardingRule resource in the specified project and region
-- using the data included in the request.
--
-- /See:/ <https://developers.google.com/compute/docs/reference/latest/ Compute Engine API Reference> for @ComputeGlobalForwardingRulesInsert@.
module Network.Google.Resource.Compute.GlobalForwardingRules.Insert
    (
    -- * REST Resource
      GlobalForwardingRulesInsertResource

    -- * Creating a Request
    , globalForwardingRulesInsert'
    , GlobalForwardingRulesInsert'

    -- * Request Lenses
    , gfriQuotaUser
    , gfriPrettyPrint
    , gfriProject
    , gfriUserIp
    , gfriKey
    , gfriOauthToken
    , gfriFields
    , gfriAlt
    ) where

import           Network.Google.Compute.Types
import           Network.Google.Prelude

-- | A resource alias for @ComputeGlobalForwardingRulesInsert@ which the
-- 'GlobalForwardingRulesInsert'' request conforms to.
type GlobalForwardingRulesInsertResource =
     Capture "project" Text :>
       "global" :>
         "forwardingRules" :>
           QueryParam "quotaUser" Text :>
             QueryParam "prettyPrint" Bool :>
               QueryParam "userIp" Text :>
                 QueryParam "key" Text :>
                   QueryParam "oauth_token" Text :>
                     QueryParam "fields" Text :>
                       QueryParam "alt" Alt :> Post '[JSON] Operation

-- | Creates a ForwardingRule resource in the specified project and region
-- using the data included in the request.
--
-- /See:/ 'globalForwardingRulesInsert'' smart constructor.
data GlobalForwardingRulesInsert' = GlobalForwardingRulesInsert'
    { _gfriQuotaUser   :: !(Maybe Text)
    , _gfriPrettyPrint :: !Bool
    , _gfriProject     :: !Text
    , _gfriUserIp      :: !(Maybe Text)
    , _gfriKey         :: !(Maybe Text)
    , _gfriOauthToken  :: !(Maybe Text)
    , _gfriFields      :: !(Maybe Text)
    , _gfriAlt         :: !Alt
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'GlobalForwardingRulesInsert'' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'gfriQuotaUser'
--
-- * 'gfriPrettyPrint'
--
-- * 'gfriProject'
--
-- * 'gfriUserIp'
--
-- * 'gfriKey'
--
-- * 'gfriOauthToken'
--
-- * 'gfriFields'
--
-- * 'gfriAlt'
globalForwardingRulesInsert'
    :: Text -- ^ 'project'
    -> GlobalForwardingRulesInsert'
globalForwardingRulesInsert' pGfriProject_ =
    GlobalForwardingRulesInsert'
    { _gfriQuotaUser = Nothing
    , _gfriPrettyPrint = True
    , _gfriProject = pGfriProject_
    , _gfriUserIp = Nothing
    , _gfriKey = Nothing
    , _gfriOauthToken = Nothing
    , _gfriFields = Nothing
    , _gfriAlt = JSON
    }

-- | Available to use for quota purposes for server-side applications. Can be
-- any arbitrary string assigned to a user, but should not exceed 40
-- characters. Overrides userIp if both are provided.
gfriQuotaUser :: Lens' GlobalForwardingRulesInsert' (Maybe Text)
gfriQuotaUser
  = lens _gfriQuotaUser
      (\ s a -> s{_gfriQuotaUser = a})

-- | Returns response with indentations and line breaks.
gfriPrettyPrint :: Lens' GlobalForwardingRulesInsert' Bool
gfriPrettyPrint
  = lens _gfriPrettyPrint
      (\ s a -> s{_gfriPrettyPrint = a})

-- | Name of the project scoping this request.
gfriProject :: Lens' GlobalForwardingRulesInsert' Text
gfriProject
  = lens _gfriProject (\ s a -> s{_gfriProject = a})

-- | IP address of the site where the request originates. Use this if you
-- want to enforce per-user limits.
gfriUserIp :: Lens' GlobalForwardingRulesInsert' (Maybe Text)
gfriUserIp
  = lens _gfriUserIp (\ s a -> s{_gfriUserIp = a})

-- | API key. Your API key identifies your project and provides you with API
-- access, quota, and reports. Required unless you provide an OAuth 2.0
-- token.
gfriKey :: Lens' GlobalForwardingRulesInsert' (Maybe Text)
gfriKey = lens _gfriKey (\ s a -> s{_gfriKey = a})

-- | OAuth 2.0 token for the current user.
gfriOauthToken :: Lens' GlobalForwardingRulesInsert' (Maybe Text)
gfriOauthToken
  = lens _gfriOauthToken
      (\ s a -> s{_gfriOauthToken = a})

-- | Selector specifying which fields to include in a partial response.
gfriFields :: Lens' GlobalForwardingRulesInsert' (Maybe Text)
gfriFields
  = lens _gfriFields (\ s a -> s{_gfriFields = a})

-- | Data format for the response.
gfriAlt :: Lens' GlobalForwardingRulesInsert' Alt
gfriAlt = lens _gfriAlt (\ s a -> s{_gfriAlt = a})

instance GoogleRequest GlobalForwardingRulesInsert'
         where
        type Rs GlobalForwardingRulesInsert' = Operation
        request = requestWithRoute defReq computeURL
        requestWithRoute r u GlobalForwardingRulesInsert'{..}
          = go _gfriQuotaUser (Just _gfriPrettyPrint)
              _gfriProject
              _gfriUserIp
              _gfriKey
              _gfriOauthToken
              _gfriFields
              (Just _gfriAlt)
          where go
                  = clientWithRoute
                      (Proxy :: Proxy GlobalForwardingRulesInsertResource)
                      r
                      u
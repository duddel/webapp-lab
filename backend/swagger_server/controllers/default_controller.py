import connexion
import six

from swagger_server.models.user import User  # noqa: E501
from swagger_server import util


def users_get():  # noqa: E501
    """Returns a list of users.

    Optional extended description in CommonMark or HTML. # noqa: E501


    :rtype: List[str]
    """
    return 'do some magic!'


def users_post(body):  # noqa: E501
    """Creates a user.

     # noqa: E501

    :param body: 
    :type body: dict | bytes

    :rtype: None
    """
    if connexion.request.is_json:
        body = User.from_dict(connexion.request.get_json())  # noqa: E501
    return 'do some magic!'


def users_user_id_get(user_id):  # noqa: E501
    """Returns a user by ID.

     # noqa: E501

    :param user_id: Parameter description in CommonMark or HTML.
    :type user_id: int

    :rtype: User
    """
    return 'do some magic!'



#ifdef HAVE_CONFIG_H
#include <config.h>
#endif
#include <wx/wx.h>

class MyApp : public wxApp
{
public:
	virtual bool OnInit();
};

IMPLEMENT_APP(MyApp)

bool MyApp::OnInit()
{
	wxFrame *frame = new wxFrame((wxFrame *)NULL, -1, "Hello World",
		wxPoint(50, 50), wxSize(450, 340));

	frame->Show(TRUE);
	return TRUE;
}

